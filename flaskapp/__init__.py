import os
# import flask library
from flask import Flask, render_template, url_for

def create_app(test_config=None):
    # create and configure the app
    app = Flask(__name__, instance_relative_config=True)
    app.config.from_mapping(
        SECRET_KEY='dev',
        DATABASE=os.path.join(app.instance_path, 'flaskapp.sqlite'),
    )

    if test_config is None:
        # load the instance config, if it exists, when not testing
        app.config.from_pyfile('config.py', silent=True)
    else:
        # load the test config if passed in
        app.config.from_mapping(test_config)

    # ensure the instance folder exists
    try:
        os.makedirs(app.instance_path)
    except OSError:
        pass       

# create routes

    # ##################################### #
    #         Authentication Routes         #
    # ##################################### #
        
    # THESE NEED TO EB CREATED LATER
    @app.route('/login')
    def login():
        return 'This would be a login page'

    # create routes
    @app.route('/logout')
    def logout():
        return 'you have logged out at this point'

    # ##################################### #
    #         Dashboard Routes              #
    # ##################################### #
    @app.route('/')
    def index():
        return render_template('index.html')


    @app.route('/studentDashboard')
    def studentDashboard():
        # return render_template('studentDashboard.html')
        pass
    
    return app

# # allows the running of the server automatically
# if __name__=='__main__':
#     app.run(debug=True, port=8000, host='127.0.0.1')