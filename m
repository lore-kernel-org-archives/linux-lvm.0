From: Chris Mason <mason@suse.com>
Subject: Re: [linux-lvm] SuSe 7.3 snapshot / reiserfs /
Message-Id: <1770390000.1010501317@tiny>
In-Reply-To: <3C3AA736.82F90806@knief.net>
References: <4575.1010476487@joergli.cocolab.de> <3C3AA736.82F90806@knief.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
Date: Tue Jan  8 08:46:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com


On Tuesday, January 08, 2002 12:00:54 AM -0800 Herman Knief
<herman@knief.net> wrote:

> I believe, if you check, that SuSE already has applied thispatch for you.
> If LVM snapshot fails with Reiser, then you should send an email to the
> SuSE list, as they would want to know that they left it out.

Correct, the suse kernel supports lvm snapshots on reiserfs out of the box.
I'd advise grabbing the suse kernel update, as it fixes a few security
problems and updates things to 2.4.16 (+ most patches in 2.4.17).

-chris
