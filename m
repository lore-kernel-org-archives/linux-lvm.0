Date: Mon, 24 Apr 2000 23:32:56 +0200
From: bert hubert <ahu@ds9a.nl>
Subject: Re: [linux-lvm] lvm-viewer/lvm-manager 0.2
Message-ID: <20000424233255.A17975@home.ds9a.nl>
References: <20000422160214.A20405@home.ds9a.nl> <Pine.LNX.4.21.0004231007210.327-100000@fogarty.spin.ie>
Mime-Version: 1.0
In-Reply-To: <Pine.LNX.4.21.0004231007210.327-100000@fogarty.spin.ie>; from paul@clubi.ie on Sun, Apr 23, 2000 at 10:09:28AM +0100
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@msede.com

On Sun, Apr 23, 2000 at 10:09:28AM +0100, Paul Jakma wrote:
> what's the potential for destroying with it? ie when you say bugs, do
> you feel they are mostly cosmetic, with the underlying interface to
> LVM being pretty stable? or??
> 
> (i'd hate to run this and find that an LV was damaged/deleted.)

Everything is done via the lvm tools. However, I sometimes pass -f or even
-f -f because the program assumes that it has already asked the user
permission.

It has not damaged any data here, but I do not want to promise that it
doesn't do any bad things.

Regards,

bert hubert

-- 
                       |              http://www.rent-a-nerd.nl
                       |                     - U N I X -
                       |          Inspice et cautus eris - D11T'95
