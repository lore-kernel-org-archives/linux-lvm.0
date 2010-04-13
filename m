Message-ID: <4BC45F55.2040006@redhat.com>
Date: Tue, 13 Apr 2010 14:11:01 +0200
From: Milan Broz <mbroz@redhat.com>
MIME-Version: 1.0
References: <4BC44D6D.1000701@redhat.com>
	<4BC4200E.5090603@redhat.com>	<d692c3.61ee.127f6071a79.Coremail.chaimvy@163.com>	<1eb3d4c.70e0.127f63c102b.Coremail.chaimvy@163.com>
	<15b92f2.93da.127f6f23309.Coremail.chaimvy@163.com>
In-Reply-To: <15b92f2.93da.127f6f23309.Coremail.chaimvy@163.com>
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

On 04/13/2010 01:33 PM, Busby.Cheung wrote:
> My LVM2 version is 2.02.54, haven't done any patch.
> Did you mean that there were some patches to fix the 'take long time'  's bug?

I mean these not-yet released changes in upstream, not that fixes all problems,
but should help

Version 2.02.63 -
  Suppress repeated errors about the same missing PV uuids.
  Bypass full device scans when using internally-cached VG metadata.
  Only do one full device scan during each read of text format metadata.

Milan
