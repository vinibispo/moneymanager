import useSWR from 'swr';
import api from '../services/api';

export function useFetch<T = any>(url: string) {
  const { data, error } = useSWR<T>(
    url,
    async (urlApi: string) => {
      const response = await api.get(urlApi);
      const { data: responseData } = response;
      return responseData;
    },
    {
      shouldRetryOnError: true,
      errorRetryCount: 5,
      errorRetryInterval: 1,
      revalidateOnReconnect: true
    }
  );
  return { data, error };
}
