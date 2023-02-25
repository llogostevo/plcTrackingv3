const ctx = document.getElementById('courseProgress');

      new Chart(ctx, {
        type: 'doughnut',
        data: {
          labels: [
            'Not Studied',
            'Need Help',
            'Needs More Study',
            'Understanding',
            'Expert'
          ],
          datasets: [{
            data: [7, 25, 29, 25, 32],
            backgroundColor: [
              'rgb(220,220,220)',
              'rgb(255, 99, 132)',
              'rgb(255, 205, 86)',
              'rgb(143,188,143)',
              'rgb(54, 162, 235)'
            ], hoverOffset: 25
          }]
        }
      });
 
      const ctx2 = document.getElementById('unit1Progress');

      new Chart(ctx2, {
        type: 'doughnut',
        data: {
          labels: [
            'Not Studied',
            'Need Help',
            'Needs More Study',
            'Understanding',
            'Expert'
          ],
          datasets: [{
            data: [7, 25, 29, 25, 32],
            backgroundColor: [
              'rgb(220,220,220)',
              'rgb(255, 99, 132)',
              'rgb(255, 205, 86)',
              'rgb(143,188,143)',
              'rgb(54, 162, 235)'
            ], hoverOffset: 25
          }]
        }
      });

      const ctx3 = document.getElementById('unit2Progress');

      new Chart(ctx3, {
        type: 'doughnut',
        data: {
          labels: [
            'Not Studied',
            'Need Help',
            'Needs More Study',
            'Understanding',
            'Expert'
          ],
          datasets: [{
            data: [7, 25, 29, 25, 32],
            backgroundColor: [
              'rgb(220,220,220)',
              'rgb(255, 99, 132)',
              'rgb(255, 205, 86)',
              'rgb(143,188,143)',
              'rgb(54, 162, 235)'
            ], hoverOffset: 25
          }]
        }
      });