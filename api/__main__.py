import os
import urllib.request

# URL of the model file on GitHub
MODEL_URL = "https://github.com/redaelfakir/nsfw_model/raw/main/nsfw_model.h5"
MODEL_PATH = "nsfw_model.h5"

# Function to download the model if it doesn't exist
def download_model():
    if not os.path.exists(MODEL_PATH):
        print("Downloading model...")
        urllib.request.urlretrieve(MODEL_URL, MODEL_PATH)
        print("Model downloaded.")

if __name__ == "__main__":
    # Download the model file if not present
    download_model()

    # Rest of your main code
    import functions  # or any other necessary imports
    # Your existing code to start the FastAPI server
