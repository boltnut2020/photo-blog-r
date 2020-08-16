SitemapGenerator::Sitemap.default_host = "https://asian-research.com"
SitemapGenerator::Sitemap.sitemaps_host = "https://asian-research.s3.amazonaws.com/"
SitemapGenerator::Sitemap.public_path = 'public/'
SitemapGenerator::Sitemap.sitemaps_path = 'sitemaps/'
SitemapGenerator::Sitemap.adapter = SitemapGenerator::WaveAdapter.new

SitemapGenerator::Sitemap.create do
  articles = Article.where("publish_status=?", true)
  articles.each do |article|
    add article_path(article), :lastmod => article.updated_at
  end
end
