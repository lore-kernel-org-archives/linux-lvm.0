Message-Id: <5.1.0.14.1.20021206103437.01e5cb68@204.151.72.2>
From: Mats Wichmann <mats@laplaza.org>
Subject: Re: [linux-lvm] Recovering from a disaster...
In-Reply-To: <206010000.1038519733@[192.168.100.3]>
References: <C65F89D1AC0BB54B865127151A24DA780BAD6497@nbexchm2.aliant.icn>
 <C65F89D1AC0BB54B865127151A24DA780BAD6497@nbexchm2.aliant.icn>
Mime-Version: 1.0
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
Date: Fri Dec  6 16:31:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.comlinux-lvm@sistina.com

 >Simple fix:
 >
 >	Until Intel-based systems have a usable bios don't put your
 >	root/boot volume on LVM. Since the BIOS will not be upgraded
 >	until at least three weeks after pigs floss I'd strongly
 >	suggest avoiding the pratice altogether.

Ahem, to fuss a bit, the BIOS is a lodestone that comes
with the *PC* architecture.  AMD-processor PC systems are
similarly afflicted; while some Intel-processor systems
(notably Itanium) are not.  Someday we'll even see PC-class
machines without a BIOS.  So the comment about the likelihood
of upgrading the BIOS is undoubtedly true.
