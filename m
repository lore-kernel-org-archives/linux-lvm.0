From: James Hawtin <oolon@ankh.org>
Subject: Re: [linux-lvm] Physical volume size changed
In-Reply-To: <20020522102722.GC802@turbolinux.com>
Message-ID: <Pine.LNX.4.44.0205221024470.11028-100000@pzat.meep.org>
MIME-Version: 1.0
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
Date: Wed May 22 05:35:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com
Cc: Jens Hoffrichter <joho@hausboot.org>


> No, you need to use "pvresize", which is part of very recent LVM tools.
> I'm not sure if it needs kernel support or not.
>

Thats a really useful addition. Does it cope with partations been
extended at the front as well as the back?

James
