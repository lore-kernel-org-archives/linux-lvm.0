Message-ID: <4B2E704F.3090208@redhat.com>
Date: Sun, 20 Dec 2009 19:43:27 +0100
From: Milan Broz <mbroz@redhat.com>
MIME-Version: 1.0
References: <784f9de10912200601o69fbbf58r155eccd0f11eb287@mail.gmail.com>
In-Reply-To: <784f9de10912200601o69fbbf58r155eccd0f11eb287@mail.gmail.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] vgextend path to device should'n be allowed
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
Cc: Maurizio Marini Gmail <marini.maurizio@gmail.com>, maumar@datalogica.com

On 12/20/2009 03:01 PM, Maurizio Marini Gmail wrote:
> IMHO, vgextend should check input and deny operation on a device instead of a
> volume group name; it should abort with an error,
...

> After extending whic /dev/sdc of 80G using wrong statement:
> vgextend /dev/mapper/VolGroup01 /dev/sdc

this works correctly with recent version of lvm2 (despite the strange syntax).

Please can you try to upgrade lvm2 (to RHEL/CentOS 5.4 version, the reported
version is from 5.3) and try it again (bu after restoring correct metadata)?

> Now, to fix it, can I issue:
> vgreduce --force  --removemissing VolGroup01

The best is revert metadata to version before the failed operation
(you pasted the correct version above:-) using vgcfgrestore command.

(The whole problem is stored "MISSING" flag in metadata, you can
also use last metadata backup, remove that flag manually and restore this
edited version.)

Milan
--
mbroz@redhat.com
