import yt_dlp

def obtener_comentarios(video_url):
    ydl_opts = {
        'skip_download': True,
        'extract_flat': True,
        'dump_single_json': True,
        'extractor_args': {'youtube': {'comment_filter': 'all'}},
    }

    with yt_dlp.YoutubeDL(ydl_opts) as ydl:
        info = ydl.extract_info(video_url, download=False)
        return info.get('comments', [])
