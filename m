From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] LVM2/Device-Mapper update
Message-ID: <20031123120659.GC31669@percy.comedia.it>
References: <20031121233558.E16901@uk.sistina.com> <20031123102014.GA13148@hout.vanvergehaald.nl>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20031123102014.GA13148@hout.vanvergehaald.nl>
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
Date: Sun Nov 23 06:08:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Sun, Nov 23, 2003 at 11:20:15AM +0100, Toon van der Pas wrote:
>> If your root filesystem is on a LV, you should run 'vgmknodes' or
>> 'vgscan --mknodes' to fix up the special files in /dev in your real
>> root filesystem after finishing with your initrd.
>
i believe so
doing this in devfs has no sense and will probably fail anyway.

l.

-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
