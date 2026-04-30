// 自动更新版权年份
document.addEventListener('DOMContentLoaded', function() {
  const currentYear = new Date().getFullYear();
  const copyrightElement = document.querySelector('.md-copyright');

  if (copyrightElement) {
    const copyrightText = copyrightElement.innerHTML;
    // 替换年份为当前年份
    const updatedText = copyrightText.replace(/Copyright &copy; \d{4}/, `Copyright &copy; ${currentYear}`);
    copyrightElement.innerHTML = updatedText;
  }
});
