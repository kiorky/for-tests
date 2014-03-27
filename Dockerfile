FROM alpine
ADD *sh /
ENTRYPOINT ["/ep.sh"]
CMD []
