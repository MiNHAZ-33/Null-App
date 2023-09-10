using System.Net.Http.Headers;
using Microsoft.AspNetCore.Mvc;

[ApiController]
[Route("api/[controller]")]
public class PredictionController : ControllerBase
{
    private readonly IHttpClientFactory _httpClientFactory;

    public PredictionController(IHttpClientFactory httpClientFactory)
    {
        _httpClientFactory = httpClientFactory;
    }

    [HttpPost]
    [Route("predict/potato")]
    public async Task<IActionResult> PredictPotato(IFormFile imageFile)
    {
        try
        {
            // Check if a file was provided
            if (imageFile == null || imageFile.Length == 0)
            {
                return BadRequest("No image file provided.");
            }

            // Create an instance of HttpClient using the factory
            using (var httpClient = _httpClientFactory.CreateClient())
            {
                // Set the base address of the FastAPI endpoint
                httpClient.BaseAddress = new Uri("http://localhost:8000/api/");

                // Create a multipart form data content to include the image
                var multipartContent = new MultipartFormDataContent();
                var imageStream = imageFile.OpenReadStream();
                var streamContent = new StreamContent(imageStream);
                streamContent.Headers.ContentDisposition = new ContentDispositionHeaderValue("form-data")
                {
                    Name = "file",
                    FileName = imageFile.FileName,
                };
                multipartContent.Add(streamContent, "file", imageFile.FileName);

                // Send the POST request with the image as the body
                var response = await httpClient.PostAsync("potato", multipartContent);

                // Handle the response as needed
                if (response.IsSuccessStatusCode)
                {
                    // Process the prediction result
                    var result = await response.Content.ReadAsStringAsync();
                    return Ok(result);
                }
                else
                {
                    // Handle error response
                    return BadRequest($"Error: {response.ReasonPhrase}");
                }
            }
        }
        catch (Exception ex)
        {
            return StatusCode(500, $"Internal server error: {ex.Message}");
        }
    }

    [HttpPost]
    [Route("predict/skin")]
    public async Task<IActionResult> PredictSkinDisease(IFormFile imageFile)
    {
        try
        {
            // Check if a file was provided
            if (imageFile == null || imageFile.Length == 0)
            {
                return BadRequest("No image file provided.");
            }

            // Create an instance of HttpClient using the factory
            using (var httpClient = _httpClientFactory.CreateClient())
            {
                // Set the base address of the FastAPI endpoint
                httpClient.BaseAddress = new Uri("http://localhost:8001/api/");

                // Create a multipart form data content to include the image
                var multipartContent = new MultipartFormDataContent();
                var imageStream = imageFile.OpenReadStream();
                var streamContent = new StreamContent(imageStream);
                streamContent.Headers.ContentDisposition = new ContentDispositionHeaderValue("form-data")
                {
                    Name = "file",
                    FileName = imageFile.FileName,
                };
                multipartContent.Add(streamContent, "file", imageFile.FileName);

                // Send the POST request with the image as the body
                var response = await httpClient.PostAsync("skin", multipartContent);

                // Handle the response as needed
                if (response.IsSuccessStatusCode)
                {
                    // Process the prediction result
                    var result = await response.Content.ReadAsStringAsync();
                    return Ok(result);
                }
                else
                {
                    // Handle error response
                    return BadRequest($"Error: {response.ReasonPhrase}");
                }
            }
        }
        catch (Exception ex)
        {
            return StatusCode(500, $"Internal server error: {ex.Message}");
        }
    }
}
