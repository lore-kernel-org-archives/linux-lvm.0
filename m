Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k88N4MPp014357
	for <linux-lvm@redhat.com>; Sat, 9 Sep 2006 00:04:22 +0100
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1GLpOY-00031l-2G
	for linux-lvm@redhat.com; Sat, 09 Sep 2006 00:04:22 +0100
Date: Sat, 9 Sep 2006 00:04:22 +0100
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] LVM metadata checksums
Message-ID: <20060908230422.GY13859@agk.surrey.redhat.com>
References: <20060908145527.GA29217@arvo.suso.org>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20060908145527.GA29217@arvo.suso.org>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Fri, Sep 08, 2006 at 02:55:27PM +0000, Mark Krenz wrote:
> Anyways, I thought that perhaps I could try to use hexedit to modify the
> UUID within the image file.  

Use the tools!
  pvchange --uuid
  vgchange --uuid


Never edit on-disk metadata by hand!
  Use vgcfgbackup to read it into a file, edit the file, then put 
  it back with vgcfgrestore.  (With pvcreates before restoring if necessary.)

Alasdair
-- 
agk@redhat.com
