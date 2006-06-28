Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k5SGGDvN010301
	for <linux-lvm@redhat.com>; Wed, 28 Jun 2006 12:16:13 -0400
Received: from mail.touchtunes.com (mail.touchtunes.com [207.96.182.162])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k5SGGCea008239
	for <linux-lvm@redhat.com>; Wed, 28 Jun 2006 12:16:12 -0400
Message-ID: <44A2AD8C.9020300@gnome.org>
Date: Wed, 28 Jun 2006 12:25:48 -0400
From: Tristan Van Berkom <tvb@gnome.org>
MIME-Version: 1.0
References: <44A29C60.8020709@gnome.org>
In-Reply-To: <44A29C60.8020709@gnome.org>
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Re: vgscan
	--force-all-update-reread-and-take-that-kernel
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
To: Tristan Van Berkom <tvb@gnome.org>
Cc: linux-lvm@redhat.com

Tristan Van Berkom wrote:
> Hello lvm folks,

Hi again...
    seems I have found a way to make the script work, by making the
"volume group" active throughout the whole procedure.

So, before I commit that and close this book... is what I am doing
insane ? is it crazy to go and add a new physical volume to a volume
group that is living and breathing ? (i.e. "active" via `vgchange -ay')

Cheers,
             -Tristan
