Date: Tue, 25 Apr 2000 00:27:58 +0100 (IST)
From: Paul Jakma <paul@clubi.ie>
Subject: Re: [linux-lvm] lvm-viewer/lvm-manager 0.2
In-Reply-To: <20000424233255.A17975@home.ds9a.nl>
Message-ID: <Pine.LNX.4.21.0004250025040.2496-100000@fogarty.spin.ie>
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: bert hubert <ahu@ds9a.nl>
Cc: linux-lvm@msede.com

On Mon, 24 Apr 2000, bert hubert wrote:

  Everything is done via the lvm tools. However, I sometimes pass -f or even
  -f -f because the program assumes that it has already asked the user
  permission.

perhaps you could build something (a mode??) into your app to do
something like poping up a window saying, eg:

'about to run "lvremove -f ... ... "
	do you agree?'

not nice for newbies, but i'd feel more comfortable. :)
  
  It has not damaged any data here, but I do not want to promise that it
  doesn't do any bad things.

of course.. i'll try it out on my laptop during the week before
running it on any servers. :)
  
  Regards,
  
  bert hubert
  
  
groetjes,
-- 
Paul Jakma	paul@clubi.ie
PGP5 key: http://www.clubi.ie/jakma/publickey.txt
-------------------------------------------
Fortune:
One good suit is worth a thousand resumes.
