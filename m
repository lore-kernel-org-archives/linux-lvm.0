From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] LVM2 2.6.0-test11
Message-ID: <20031202081230.GB17340@percy.comedia.it>
References: <20031202031433.DHOQ11377.front-mail@[172.16.1.237]>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20031202031433.DHOQ11377.front-mail@[172.16.1.237]>
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
Date: Tue Dec  2 02:13:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Tue, Dec 02, 2003 at 03:14:33AM +0000, narm@go.com.jo wrote:
>I have managed to compile 2.6.0-test11 patched with the latest patch <thornber> and the new device-mapper and new LVM2 tools and everything is ok, I boot and everything is fine until the filesystem check!! I get this error
>fsck.ext3
>No such device or address while trying to open /dev/V00/LV00Root
>
>yes may root is on lvm1, when I boot from 2.4.22 <lvm1> there is no problem with my root boots fine here.
>
lvm2 uses different major/minor number than lvm2.
you should run vgmknodes (lvm2 2.00.08) before fsck.

regards,
L.

-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
