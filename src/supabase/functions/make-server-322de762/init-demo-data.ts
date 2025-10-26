// Демо-данные отключены. Все данные управляются через админ-панель.
// Если нужно создать демо-данные, используйте админ-панель.

import * as kv from './kv_store.ts';

export async function initializeDemoData() {
  console.log('ℹ️ Demo data initialization disabled. Use admin panel to add content.');
  
  return {
    success: true,
    message: 'Demo data initialization is disabled. Please use admin panel to add content.',
    stats: {
      publications: 0,
      albums: 0,
      achievements: 0,
      portfolio: 0,
      reviews: 0,
      audio: 0,
      videos: 0,
      pages: 0,
    }
  };
}
