const constructQuery = query =>
    Object.keys(query)
        .map(param => {
            const value = query[param];
            const queryValue = Array.isArray(value)
                ? value.map(v => encodeURIComponent(v)).join(',')
                : encodeURIComponent(value);
            return `${param}=${queryValue}`;
        })
        .join('&');

export { constructQuery };
