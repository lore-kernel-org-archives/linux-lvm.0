Received: from localhost (dhcp-100-19-150.bos.redhat.com [10.16.19.150])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p690pXAG010342
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NO)
	for <linux-lvm@redhat.com>; Fri, 8 Jul 2011 20:51:34 -0400
Date: Fri, 8 Jul 2011 20:51:33 -0400
From: Mike Snitzer <snitzer@redhat.com>
Message-ID: <20110709005133.GA6588@redhat.com>
References: <4E16942E.9070204@tlinx.org>
	<defbc387-1bad-4241-b8b4-b0f8a04f2cd8@email.android.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <defbc387-1bad-4241-b8b4-b0f8a04f2cd8@email.android.com>
Subject: Re: [linux-lvm] what use is virtualsize -- or how is it to be used?
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Fri, Jul 08 2011 at  7:17pm -0400,
adultsitesoftware@gmail.com <support@bettercgi.com> wrote:

> Virtual size lets you create a 200G file system om a 20G LV and then lvextend as needed, without the need to resize the filesystem. Read about sparse files for ideas of other uses.
> 
> It'd like a sparse device in that blocks need not actually exist until they are written to.
> 
> It currently has a performance and flexibility impact that prevents us from using it, though we would like to.

Please have a look at the DM thinp target that was just posted to
dm-devel.

We don't have lvm2 support for this thinp target yet, we are working on
it, but thinp is a much richer solution that should address your needs.

Mike
