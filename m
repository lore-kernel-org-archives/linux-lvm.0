Date: Sun, 9 Apr 2000 01:30:02 +0200
From: bert hubert <ahu@ds9a.nl>
Subject: Re: [linux-lvm] LVM Viewer / Manager app
Message-ID: <20000409013001.A26283@home.ds9a.nl>
References: <20000404225012.A8198@home.ds9a.nl> <38EAE276.14363A36@osp.nl> <20000405205056.A1952@home.ds9a.nl> <wxxhfdctdcm.fsf@lyngve.ifi.uio.no>
Mime-Version: 1.0
In-Reply-To: <wxxhfdctdcm.fsf@lyngve.ifi.uio.no>; from terjekv@ifi.uio.no on Sun, Apr 09, 2000 at 12:52:25AM +0200
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@msede.com

On Sun, Apr 09, 2000 at 12:52:25AM +0200, Terje Kvernes wrote:

> > Please do. I am currently reimplementing the tool in C (it used to
> > be in perl).
> 
> umh, no to start a flame, but wjy?

The main reason is that if I write it in perl you need:

	gtk+
	perlgtk+
	libxml
	perl libxml
	perl
	libglade
	perl libglade

These may not be available everywhere, to say the least. Also, I can't make a static version.

Another important reason is that I like C better. 

Regards,

bert hubert.

-- 
                       |              http://www.rent-a-nerd.nl
                       |                     - U N I X -
                       |          Inspice et cautus eris - D11T'95
