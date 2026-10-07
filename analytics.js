// Preserve existing analytics, excluding local previews.
if (["kevinrychel.com", "www.kevinrychel.com"].includes(window.location.hostname)) {
  window.dataLayer = window.dataLayer || [];
  window.gtag = function () { window.dataLayer.push(arguments); };
  window.gtag("js", new Date());
  window.gtag("config", "G-0YGPW0PFP0");
  const script = document.createElement("script");
  script.async = true;
  script.src = "https://www.googletagmanager.com/gtag/js?id=G-0YGPW0PFP0";
  document.head.append(script);
}
