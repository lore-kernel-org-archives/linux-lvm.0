Date: Thu, 12 Oct 2000 22:43:38 +0200
From: Nils Juergens <nils@muon.de>
Subject: Re: [linux-lvm] lv inactive after reboot
Message-ID: <20001012224338.A17900@muon.de>
References: <Pine.LNX.4.21.0010051925000.1212-100000@rossi.itg.ie> <Pine.LNX.4.21.0010100923370.31996-100000@rossi.itg.ie>
Mime-Version: 1.0
In-Reply-To: <Pine.LNX.4.21.0010100923370.31996-100000@rossi.itg.ie>; from paulj@itg.ie on Tue, Oct 10, 2000 at 09:35:22AM +0100
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@msede.com

On Tue, 10.10.00, Paul Jakma <paulj@itg.ie> wrote:
> i still can not get this LV to come up as active after a vgscan -ay. I
> have to activate it manually with lvchange.
> 
> is this a known problem? is there a fix?

Isn't this default behavior? My vgscan showns no sign of -a or -y, these
are vgchange options.

This is what i do in my startup-scripts:

/sbin/vgscan
/sbin/vgchange -a y

cu,

Nils

-- 
 >   Nils Juergens  | nils@muon.de | icq 7090774   <
 >  If we all work hard, we can turn this company  <
 >      around 360 degrees -- gruntbert(LOTD)      <
