import "../stylesheets/application";
// 'turbolinks:load'の記載があればロードのたびにイベントが発火する
document.addEventListener('turbolinks:load', function() {
    
  const tabMenus = document.querySelectorAll('.tab__menu-item');

  tabMenus.forEach((tabMenu) => {
  tabMenu.addEventListener('click', tabSwitch);
    })
    
});

function tabSwitch(e) {
  // クリックされた要素のデータ属性を取得
  const tabTargetData = e.currentTarget.dataset.tab;
  
  // 「closest('.tab__menu')」はクリックされた要素の親要素を取得する
  const tabList = e.currentTarget.closest('.tab__menu');
  const tabItems = tabList.querySelectorAll('.tab__menu-item');

  // 「nextElementSibling」はクリックされた要素の親要素の兄弟要素の子要素を取得
  const tabPanelItems = tabList.
  nextElementSibling.querySelectorAll('.tab__panel-box');

  // クリックされたtabの同階層のmenuとpanelのクラスを削除
  tabItems.forEach((tabItem) => {
    tabItem.classList.remove('is-active');
  })
  tabPanelItems.forEach((tabPanelItem) => {
    tabPanelItem.classList.remove('is-show');
  })
    
  // クリックされたmenu要素にis-activeクラスを付加
  e.currentTarget.classList.add('is-active');

  // クリックしたmenuのデータ属性と等しい値を持つパネルにis-showクラスを付加
  tabPanelItems.forEach((tabPanelItem) => {
    if (tabPanelItem.dataset.panel ===  tabTargetData) {
      tabPanelItem.classList.add('is-show');
    }
  })
  
}