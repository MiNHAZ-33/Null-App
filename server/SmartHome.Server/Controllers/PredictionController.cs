using System.Net.Http.Headers;
using Microsoft.AspNetCore.Mvc;

namespace SmartHome.Server.Controllers;

[ApiController]
[Route("api/[controller]")]
public class PredictionController : ControllerBase
{
    private readonly IHttpClientFactory _httpClientFactory;

    public PredictionController(IHttpClientFactory httpClientFactory)
    {
        _httpClientFactory = httpClientFactory;
    }
    const string ROOT_PATH = "http://localhost:8000/api/";


    [HttpPost("potato")]
    public async Task<IActionResult> Potato([FromBody] string imageUrl)
    {
        try
        {
            // Create an instance of HttpClient using the factory
            using (var httpClient = _httpClientFactory.CreateClient())
            {
                httpClient.BaseAddress = new Uri(ROOT_PATH);

                // Create a byte array from the image file
                byte[] imageBytes;
                using (var stream = new FileStream("path_to_your_image.jpg", FileMode.Open))
                {
                    using (var memoryStream = new MemoryStream())
                    {
                        await stream.CopyToAsync(memoryStream);
                        imageBytes = memoryStream.ToArray();
                    }
                }

                // Create a ByteArrayContent from the image bytes
                var imageContent = new ByteArrayContent(imageBytes);
                imageContent.Headers.ContentType = MediaTypeHeaderValue.Parse("image/jpeg");

                // Create a multipart form data content to include the image
                var multipartContent = new MultipartFormDataContent();
                multipartContent.Add(imageContent, "image", "image.jpg");

                // Send the POST request with the image as the body
                var response = await httpClient.PostAsync("/upload", multipartContent);

                // Handle the response as needed
                if (response.IsSuccessStatusCode)
                {
                    // Image upload was successful
                    return Ok("Image uploaded successfully.");
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

