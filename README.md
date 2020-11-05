# apjung-gitops

### 오브젝트 명명
<table>
<tr>
    <th>오브젝트</th>
    <th>파일이름</th>
    <th>yaml 안에서</th>
</tr>
<tr>
    <td>Deployment</td>
    <td>Deploy.yaml</td>
    <td>deploy</td>
</tr>
<tr>
    <td>Ingress</td>
    <td>Ingress.yaml</td>
    <td>ingress</td>
</tr>
<tr>
    <td>Service</td>
    <td>Service.yaml</td>
    <td>svc</td>
</tr>
<tr>
    <td>ReplicaSet</td>
    <td>Replica.yaml</td>
    <td>replica</td>
</tr>
<tr>
    <td>Pod</td>
    <td>Pod.yaml</td>
    <td>pod</td>
</tr>
<tr>
    <td>ConfigMaps</td>
    <td>ConfigMaps.yaml</td>
    <td>configmaps</td>
</tr>
<tr>
    <td>Secrets</td>
    <td>Secrets.yaml</td>
    <td>Secrets</td>
</tr>
</table>

### 오브젝트 구성파일 규칙
- `ObjectKind`는 위의 오브젝트 명명 규칙을따른다
- `Directory`/`ObjectKind.yaml`
- 예시 `infra/jenkins/Deploy.yaml`

### 오브젝트 `metadata.name` 작성 규칙
- directory를 하이푼(-)으로 분리한다. 예를들어 디렉토리가 apjung-backend/dev에 있는 Deployment라면 `apjung-backend-dev-deploy`가 된다

<table>
<tr>
    <th>오브젝트</th>
    <th>규칙</th>
    <th>디렉토리/파일(오브젝트)</th>
    <th>에시</th>
</tr>
<tr>
    <td>Deployment</td>
    <td>{directory}-{directory}-deploy</td>
    <td>infra/jenkins/dev-agent/Deployment.yaml</td>
    <td>infra-jenkins-dev-agent-deploy</td>
</tr>
</table>

- Optional한 무언가가 더 필요하다면 뒤에 하이푼(-)을 붙이고 넣어준다
- 예시 `apjung-backend-dev.pv-optional`

### 오브젝트 `metadata.label` 작성 규칙
- 키는 아래 링크의 권장레이블 규칙을 사용하도록 한다.
- `app.kubernetes.io/name`에 디렉토리를 적어준다
- `app.kubernetes.io/instance`에 `metadata.name`을 적어준다
- [링크](https://kubernetes.io/ko/docs/concepts/overview/working-with-objects/common-labels/)

