Date: Tue, 25 Apr 2000 02:16:06 +0200
From: bert hubert <ahu@ds9a.nl>
Subject: Re: [linux-lvm] lvm-viewer/lvm-manager 0.2
Message-ID: <20000425021606.A21137@home.ds9a.nl>
References: <20000424233255.A17975@home.ds9a.nl> <Pine.LNX.4.21.0004250025040.2496-100000@fogarty.spin.ie>
Mime-Version: 1.0
In-Reply-To: <Pine.LNX.4.21.0004250025040.2496-100000@fogarty.spin.ie>; from paul@clubi.ie on Tue, Apr 25, 2000 at 12:27:58AM +0100
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Paul Jakma <paul@clubi.ie>
Cc: linux-lvm@msede.com

On Tue, Apr 25, 2000 at 12:27:58AM +0100, Paul Jakma wrote:

>   Everything is done via the lvm tools. However, I sometimes pass -f or even
>   -f -f because the program assumes that it has already asked the user
>   permission.
> 
> perhaps you could build something (a mode??) into your app to do
> something like poping up a window saying, eg:

Yeah - I am currently revamping the source so that all external calls get
routed through doexec(), which will have a flag 'modifies data', that can
cause doexec() to popup a window.

The problem is that the program does not always deal well with failures. I
have yet to implement reverse-drag-and-drop, in case the drop failed.

>   It has not damaged any data here, but I do not want to promise that it
>   doesn't do any bad things.
> 
> of course.. i'll try it out on my laptop during the week before
> running it on any servers. :)

Would be a good idea :-)

Regards,

bert hubert.

-- 
                       |              http://www.rent-a-nerd.nl
                       |                     - U N I X -
                       |          Inspice et cautus eris - D11T'95
