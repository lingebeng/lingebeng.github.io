// 自动从 frontmatter tags 生成自定义标签样式
document.addEventListener('DOMContentLoaded', function() {
  // 查找文章标题
  const article = document.querySelector('.md-content article');
  const h1 = article?.querySelector('h1');

  if (!h1) return;

  // 从页面元数据中获取标签（Material 插件会将 tags 添加到页面）
  const metaTags = document.querySelectorAll('meta[property="article:tag"]');

  if (metaTags.length === 0) return;

  // 创建标签容器
  const tagContainer = document.createElement('div');
  tagContainer.style.cssText = 'margin: 1.5rem 0 1rem 0; display: flex; gap: 0.4rem; flex-wrap: wrap;';

  // 为每个标签创建徽章
  metaTags.forEach(meta => {
    const tagName = meta.getAttribute('content');
    const tagSpan = document.createElement('span');
    tagSpan.style.cssText = 'padding: 0.2rem 0.6rem; background: var(--md-accent-fg-color); color: white; border-radius: 0.75rem; font-size: 0.75rem;';
    tagSpan.textContent = '#' + tagName;
    tagContainer.appendChild(tagSpan);
  });

  // 将标签容器插入到标题后面
  h1.insertAdjacentElement('afterend', tagContainer);
});
