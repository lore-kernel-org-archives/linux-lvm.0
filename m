Message-ID: <4BC44D6D.1000701@redhat.com>
Date: Tue, 13 Apr 2010 12:54:37 +0200
From: Milan Broz <mbroz@redhat.com>
MIME-Version: 1.0
References: <4BC4200E.5090603@redhat.com>	<d692c3.61ee.127f6071a79.Coremail.chaimvy@163.com>
	<1eb3d4c.70e0.127f63c102b.Coremail.chaimvy@163.com>
In-Reply-To: <1eb3d4c.70e0.127f63c102b.Coremail.chaimvy@163.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] what does 'orphan vg' mean?(global vg?)
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
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: "Busby.Cheung" <chaimvy@163.com>

On 04/13/2010 10:14 AM, Busby.Cheung wrote:
>       Thank you very much for so qucik answer.
>       The reason cause me to read the source code is you mentioned in
> your email: 'vgscan'. When I use the 'vgs' cmd, it maybe take a long
> time, the 'vgs' can't be executed  parallelly? The 'vgs' cmd will scan
> all the devices, once one device locked, it will wait till timeout or
> err come(device err)?  

vgs take global lock for performance reasons (it can use cached metadata
completely then), so it waits for some time if vgscan run in parallel.
(but you do not need to run vgscan at all except adding new device or so)

full scan should not take too much time, but there was some bug fixed
recently (missing device was searched too many times slowing everything down)

Milan
