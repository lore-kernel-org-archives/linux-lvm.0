From: "SI Reasoning" <si@si.homelinux.org>
Subject: Re: [linux-lvm] raid and lvm
Message-ID: <20030128.rVq.68055000@dl380.home.network>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Date: Tue Jan 28 12:55:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

maybe I am misunderstanding. I was looking to do software raid (off of a non-raid
SCSI controller.)
The main reason I wanted raid5 was as a failsafe measure since it would appear
that things can get tricky if a harddrive fails in lvm. Is there another way to
create a failsafe through lvm without needing to implement software raid?

Christophe Saout (christophe@saout.de) wrote*:
>
>Am Die, 2003-01-28 um 18.34 schrieb SI Reasoning:
>
>> I was following an old list and at that time they felt that it would be
>> more efficient to merge either lvm into raid or vice-versa.
>
>Yes. I've looked into the DM code in the kernel and I have to say it's a
>very clean architecture. Since LVM2 needs some kind of Raid 0 (a
>transparent mirror in the background) to implement pvmove it would be a
>code duplication.
>
>Also since DM has a nice plugin architecture and already has generic bio
>splitting code, it would even save some memory when the raid drivers
>would be reimplemented as DM plugins. (so the bloat argument doesn't
>count)
>
>Also you don't need the extra meta data the raid code actually has (ok,
>raid autodetection won't work anymore but as far I understand the kernel
>developers, that's depracted anyway). I've had problems with the raid
>metadata code that could have been solved with things like vgexport and
>vgimport.
>
>But I think that's going to be adressed via the new in-kernel
>initramdisk anyway.
>
>And I think that the performance is better when raid is implemented in
>DM than to run one device mapper over another one.
>
>
>
>_______________________________________________
>linux-lvm mailing list
>linux-lvm@sistina.com
>http://lists.sistina.com/mailman/listinfo/linux-lvm
>read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>

--
SI Reasoning
si@mindspring.com
gpg public key ftp://ftp.p-p-i.com/pub/si-mindspring-pubkey.asc

The significant problems we face cannot be solved by
the same level of thinking that created them.
-Albert Einstein
