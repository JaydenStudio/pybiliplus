import requests

cpdef str view(int update = 0, int aid = -1, str bvid = None):
    if aid is -1 and bvid is None:
        raise ValueError("aid 和 bvid 必须至少有一个非空")
    
    cdef str url = 'https://biliplus.com/api/view'
    cdef dict params = {'update': update}
    
    if aid is not None:
        params['id'] = aid
    else:
        params['id'] = bvid
    
    response = requests.get(url, params=params)
    return response.text

