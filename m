Date: Sat, 20 Nov 1999 15:22:29 +0100
From: Sune Kirkeby <sune@interspace.dk>
Subject: Re: [linux-lvm] kernel oops.
Message-ID: <19991120152229.A28224@interspace.dk>
References: <Pine.A32.3.94.991119162848.17956A-100000@clio.dlib.indiana.edu> <19991119235840.A11444@gruyere.muc.suse.de>
Mime-Version: 1.0
In-Reply-To: <19991119235840.A11444@gruyere.muc.suse.de>; from Matthias G. Eckermann on Fri, Nov 19, 1999 at 11:58:40PM +0100
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Matthias G. Eckermann" <mge@suse.de>
Cc: linux-lvm@msede.com, Rusty Wickell <twickell@clio.dlib.indiana.edu>

On Fri, Nov 19, 1999 at 11:58:40PM +0100, Matthias G. Eckermann wrote:
> 
> Well, I did not check, but I think, switches and parameters
> should be separated by space, i.e.:
> 	lvcreate -L 5000 -n reallv realvg
>  

Actually, the LVM-HOWTO (which is where the commands are introduced)
gives all it's examples w/o separation of switches and parameters,
it probably does not matter at all.

-- 
Sune Kirkeby | "Imagine, if you will, that there were no such
             |  thing as a hypothetical situation..."
