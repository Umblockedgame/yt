import yt_dlp
import time

def get_video_url_with_proxy(video_url):
    ydl_opts = {
        'format': 'best',
        'noplaylist': True,
        'quiet': True,
        'proxy': 'http://35.185.196.38:3128',  # Reemplaza con tu proxy
        'throttled_rate': 1024,  # Limita la velocidad de descarga para evitar bloqueos
    }

    with yt_dlp.YoutubeDL(ydl_opts) as ydl:
        try:
            info = ydl.extract_info(video_url, download=False)
            formats = info.get('formats', [])
            for f in formats:
                if f.get('url'):
                    print(f['url'])
        except yt_dlp.utils.DownloadError as e:
            print(f"Error: {e}")
            # Esperar y reintentar
            time.sleep(30)  # Espera de 30 segundos antes de reintentar
            get_video_url_with_proxy(video_url)

# Ejemplo de uso
get_video_url_with_proxy('https://www.youtube.com/watch?v=BVdngsy95mY')
