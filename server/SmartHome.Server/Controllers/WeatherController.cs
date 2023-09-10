using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;

namespace SmartHome.Server.Controllers;

[ApiController]
[Route("api/[controller]")]
public class WeatherController : ControllerBase
{
    private readonly HttpClient _httpClient;
    const string API_KEY = "289de7bc1d5a4f35961141011230909";

    public WeatherController(HttpClient httpClient)
    {
        _httpClient = httpClient;
    }


    [HttpGet]
    public async Task<IActionResult> GetWeather(string lat, string lon)
    {
        string apiUrl = $"http://api.weatherapi.com/v1/current.json?key={API_KEY}&q={lat},{lon}&aqi=yes";

        HttpResponseMessage response = await _httpClient.GetAsync(apiUrl);

        try
        {
            if (response.IsSuccessStatusCode)
            {
                var content = await response.Content.ReadAsStringAsync();
                dynamic jsonData = JsonConvert.DeserializeObject(content)!;

                // Access the "temp_c" and "humidity" values
                double tempC = jsonData.current.temp_c;
                int humidity = jsonData.current.humidity;
                string condition = jsonData.current.condition.text;

                var respone = new Dictionary<string, string>() {
                    { "tempC", tempC.ToString() },
                    { "humidity", humidity.ToString() },
                    { "condition", condition.ToString()}
                };

                return Ok(respone);
            }
            else
            {
                return BadRequest($"Error: {response.ReasonPhrase}");
            }
        }
        catch (Exception ex)
        {
            return BadRequest(ex.Message);
        }
    }
}
