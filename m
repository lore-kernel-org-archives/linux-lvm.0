Message-ID: <38EAE917.6FF9B248@msede.com>
Date: Wed, 05 Apr 2000 09:19:51 +0200
From: Michael Marxmeier <mike@msede.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] LVM Viewer / Manager app
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@msede.com

Forwarded message ...

-------- Original Message --------
Date: Wed, 5 Apr 2000 04:23:19 +0200
From: Daniel Roesen <dr@bofh.de>
Subject: Re: [linux-lvm] LVM Viewer / Manager app
References: <20000404225012.A8198@home.ds9a.nl>

On Tue, Apr 04, 2000 at 10:50:13PM +0200, bert hubert wrote:
> I'm currenly thinking about making this a full blown LVM manager, does
> anybody have ideas on what the best paradigm would be?

Make it (n)curses based so it can be used on servers which usually
lack any X11 stuff and get remote-administered (sometimes over slow
links).


Best regards,
Daniel
