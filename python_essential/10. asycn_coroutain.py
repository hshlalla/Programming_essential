#동기식 처리방식은 한계가있다 싱글스레드만 사용하기때문에 한개가 지연처리 되면 느리게진행됨
import time
def find_users_sync(n):
    for i in range(1, n+1):
        print(f'{n} 명중{i} 번째 사용자 조회중..')
        time.sleep(0.1) #의도적으로 지연발생
    print(f'>  총{n}명 사용자 동기조회 완료!')

def process_sync():
    start = time.time()
    find_users_sync(3)
    find_users_sync(2)
    find_users_sync(1)
    end = time.time()
    print(f'>>> 동기 처리 중 소요시간: {end -start}')

# 비동기방식


if __name__== "__main__":
    process_sync()