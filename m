From: =?iso-8859-1?Q?Jos=E9_Luis_Domingo_L=F3pez?= <linux-lvm@24x7linux.com>
Subject: Re: [linux-lvm] creating a LVM ontop of a cryptated (ppdd) loop back device
Message-ID: <20021017211217.GB4861@localhost>
References: <3DAEDEE5.4540B954@silicide.dk>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3DAEDEE5.4540B954@silicide.dk>
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
Date: Thu Oct 17 16:13:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Thursday, 17 October 2002, at 18:01:41 +0200,
Jon Bendtsen wrote:

> I'm trying to cryptate my filesystems, and be able to take snapshots of
> them.
> I cannot get a snapshot of a cryptated LV to work (maybe because it is
> readonly)
>
I haven't tried, but wouldn't it be possible to just take a snapshots
from a LV containing an encrypted filesystem, and then loop-mount it
(assuming encrypted via the loop device), give the password, and then
backup ?

I think from the loop-aes type of filesystem encryption point of view.
But as I have said previously, I haven't tried if this works, although
if my understanding of all these things is OK, should work.

I will try to test this setup tomorrow when I get to work :-)

-- 
Jose Luis Domingo Lopez
Linux Registered User #189436     Debian Linux Woody (Linux 2.4.19-pre6aa1)
