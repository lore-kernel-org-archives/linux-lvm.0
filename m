Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p711I70t014138
	for <linux-lvm@redhat.com>; Sun, 31 Jul 2011 21:18:07 -0400
Received: from mail-wy0-f174.google.com (mail-wy0-f174.google.com
	[74.125.82.174])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p711I6IC029508
	for <linux-lvm@redhat.com>; Sun, 31 Jul 2011 21:18:07 -0400
Received: by wyg8 with SMTP id 8so1230230wyg.33
	for <linux-lvm@redhat.com>; Sun, 31 Jul 2011 18:18:06 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <4DEB0D46292F45E8A1FE55F7BB47ED64@Chimpanzeke>
References: <4DEB0D46292F45E8A1FE55F7BB47ED64@Chimpanzeke>
From: Eugene Vilensky <evilensky@gmail.com>
Date: Sun, 31 Jul 2011 20:17:46 -0500
Message-ID: <CAEUKkZ8=faUG9eRMAz+OD-VXKqvrYH6iDwyPF0szJdB5866z7Q@mail.gmail.com>
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] Please help me recover my LVM configuration
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
Content-Type: text/plain; charset="utf-8"
To: LVM general discussion and development <linux-lvm@redhat.com>

On Sat, Jul 30, 2011 at 5:06 PM, David Ziring <zeke@thebayou.net> wrote:
> So, assuming the data is still on /dev/sdc1, if I recreate the PV, will I
> lose data?� i.e., will pvcreate �vvvv �u <my uuid> /dev/sdc1 destroy the
> data on the partition?
> Similiarly, will vgcreate �v <my volumename> /dev/sdc1 kill my data?

David,

If all that you have destroyed is the partition table, you may be able
to simply recover that appropriately, reboot, and vgscan everything
back into place.  If you still have your partition table intact�if
there is more extensive damage, Ray has shared about as detailed
instructions as one can find on a mailing list for a class of problem.

I wouldn't go about re-creating anything until you've ascertained what
has been lost, which is slightly unclear from your mailings.

-Ev
