Return-Path: <mjt@tls.msk.ru>
Message-ID: <3B1FED48.DB80BF00@tls.msk.ru>
Date: Fri, 08 Jun 2001 01:08:24 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
MIME-Version: 1.0
Subject: Re: [linux-lvm] LILO configuration for LVM "boot" filesystem
References: <20010605210727.C1870@pc.ilinx> <3B1F9E1C.1984FAF8@wrkhors.com>
Content-Transfer-Encoding: 7bit
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Steven Lembark wrote:
> 
[]
> Use separate mount points for /var, /usr & /home.  This keeps
> root down to mainly /etc, /dev, /bin, /sbin and /lib -- none of
> which is all that enormous.  Short of writing the File From Hell
> to /tmp a 128MB root file system works well enough for me.  I do
> put /usr & /opt on LVM but only because all the tools needed to
> revive the system are in /bin, /sbin & /lvm on the root.

Another thing to consider if you run 2.4 kernel -- mount tmpfs
on /tmp (and give some reasonable size restrictions).   This way,
/tmp works much faster, does not need to be cleaned on boot, and
will not eat root's space.  You should have reasonable swap space
it you plan to use it heavily.  Works very well here.

Regards,
 Michael.
