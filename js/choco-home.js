// Chocolate Shop Homepage JavaScript

// Cart functionality
let cartItems = 2;
let cart = [];

// Demo: Cart items count and "View More" buttons
document.addEventListener('DOMContentLoaded', function() {
  // Handle "View More" buttons
  document.querySelectorAll('.card.highlight button').forEach(btn => {
    btn.onclick = function() {
      alert("See more products coming soon!");
    };
  });

  // Handle "See Our Offer" button
  document.querySelector('.hero-text button').onclick = function() {
    document.querySelector('.products').scrollIntoView({
      behavior: 'smooth'
    });
  };

  // Handle product card clicks
  // document.querySelectorAll('.card:not(.highlight)').forEach(card => {
  //   card.style.cursor = 'pointer';
  //   card.onclick = function() {
  //     const title = this.querySelector('.prod-title').textContent;
  //     const price = this.querySelector('.prod-price').textContent;

  //     if (confirm(`Add ${title} (${price}) to cart?`)) {
  //       addToCart(title, price);
  //     }
  //   };
  // });

  document.querySelectorAll('.card:not(.highlight)').forEach(card => {
  card.style.cursor = 'pointer';
  card.onclick = function() {
    const id = card.getAttribute('data-id');  // Use data-id for product identification
    if (id) {
      // Redirect to product.html passing the product ID as query param
      window.location.href = `product.html?id=${id}`;
    }
  };
});


  // Handle navigation clicks
  document.querySelectorAll('.navbar ul li').forEach(item => {
    item.onclick = function() {
      const page = this.textContent.toLowerCase();
      switch(page) {
        case 'home':
          window.scrollTo({top: 0, behavior: 'smooth'});
          break;
        case 'shop':
          document.querySelector('.products').scrollIntoView({behavior: 'smooth'});
          break;
        case 'about':
          document.querySelector('footer').scrollIntoView({behavior: 'smooth'});
          break;
        default:
          alert(`${this.textContent} page coming soon!`);
      }
    };
  });

  // Handle cart click
  document.querySelector('.cart').onclick = function() {
    showCart();
  };
});

// Add to cart function
function addToCart(title, price) {
  cart.push({title, price});
  cartItems++;
  updateCartDisplay();

  // Show success message
  showNotification(`${title} added to cart!`);
}

// Update cart display
function updateCartDisplay() {
  document.querySelector('.cart').textContent = `Cart (${cartItems} Items)`;
}

// Show cart contents
function showCart() {
  if (cart.length === 0) {
    alert('Your cart is empty');
    return;
  }

  let cartContents = 'Cart Contents:\n\n';
  let total = 0;

  cart.forEach((item, index) => {
    const price = parseFloat(item.price.replace('$', ''));
    cartContents += `${index + 1}. ${item.title} - ${item.price}\n`;
    total += price;
  });

  cartContents += `\nTotal: $${total.toFixed(2)}`;
  alert(cartContents);
}

// Show notification
function showNotification(message) {
  // Create notification element
  const notification = document.createElement('div');
  notification.style.cssText = `
    position: fixed;
    top: 20px;
    right: 20px;
    background: #ad7b59;
    color: white;
    padding: 15px 20px;
    border-radius: 5px;
    box-shadow: 0 4px 6px rgba(0,0,0,0.3);
    z-index: 1000;
    font-weight: bold;
    animation: slideIn 0.3s ease-out;
  `;
  notification.textContent = message;

  // Add animation keyframes
  if (!document.querySelector('#notification-styles')) {
    const style = document.createElement('style');
    style.id = 'notification-styles';
    style.textContent = `
      @keyframes slideIn {
        from { transform: translateX(100%); opacity: 0; }
        to { transform: translateX(0); opacity: 1; }
      }
      @keyframes slideOut {
        from { transform: translateX(0); opacity: 1; }
        to { transform: translateX(100%); opacity: 0; }
      }
    `;
    document.head.appendChild(style);
  }

  document.body.appendChild(notification);

  // Remove notification after 3 seconds
  setTimeout(() => {
    notification.style.animation = 'slideOut 0.3s ease-in';
    setTimeout(() => {
      document.body.removeChild(notification);
    }, 300);
  }, 3000);
}

// Smooth scrolling for anchor links
document.addEventListener('click', function(e) {
  if (e.target.tagName === 'A' && e.target.getAttribute('href')?.startsWith('#')) {
    e.preventDefault();
    const target = document.querySelector(e.target.getAttribute('href'));
    if (target) {
      target.scrollIntoView({behavior: 'smooth'});
    }
  }
});

// Add loading animation
window.addEventListener('load', function() {
  document.body.style.opacity = '0';
  document.body.style.transition = 'opacity 0.5s';

  setTimeout(() => {
    document.body.style.opacity = '1';
  }, 100);
});

