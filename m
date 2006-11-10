Mime-Version: 1.0 (Apple Message framework v624)
In-Reply-To: <1163152099.2961.68.camel@laguna.nwhq.nl>
References: <1163152099.2961.68.camel@laguna.nwhq.nl>
Message-Id: <02ac015d0526931d1024f1549d98a49c@redhat.com>
Content-Transfer-Encoding: 7bit
From: Jonathan E Brassow <jbrassow@redhat.com>
Subject: Re: [linux-lvm] LVM groups not visible
Date: Fri, 10 Nov 2006 09:27:21 -0600
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>, jlblom@neuroweave.nl

I can't imagine putting LVM on a USB drive...  Are you sure LVM is even 
involved here?

You can type 'mount' or 'df' at the command prompt.  That will tell you 
how the usbdisk is mounted.  If it is mounted from /dev/sda1 - then 
there is no LVM in the mix.

  brassow

On Nov 10, 2006, at 3:48 AM, J.L. Blom wrote:

> Hi,
> I'm rather new to LVM and I have a - I think - simple question.
> I have a removable disk (USB) with several volumegroups on it created
> with one system (linux 2.6.18-1.2200.fc5). I wanted to use it to backup
> from another system (linux 2.6.14-386: ubuntu) the W2000 partition.
> WHen I connect the disk it is seen as usbdisk on /dev/sda1 and the
> content is displayed.
> However, lvdisplay says: " no volume groups found"
> lvscan says: " no volume groups found"
> pvscan says: " no matching physical volumes found"
> But the content is visible in nautilus and I can write and read.
> Hope somebody can clarify and help me.
> Joep
>
>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
