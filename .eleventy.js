import CleanCSS from 'clean-css'; 

export default async function (eleventyConfig) {
  eleventyConfig.addPassthroughCopy("src/assets/");

	eleventyConfig.addFilter("cssmin", function (code) {
		return new CleanCSS({}).minify(code).styles;
	});

  return {
    dir: {
      input: "src",
      output: "docs",
    },
  };
}
