Received: from fentible.pjc.net (vpnuser1.surrey.redhat.com [172.16.9.1])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id i86CDdJ0005843
	for <linux-lvm@redhat.com>; Mon, 6 Sep 2004 13:13:40 +0100
Received: from patrick by fentible.pjc.net with local (Exim 4.34)
	id 1C4INP-00011W-Sf
	for linux-lvm@redhat.com; Mon, 06 Sep 2004 13:13:39 +0100
Date: Mon, 6 Sep 2004 13:13:39 +0100
From: Patrick Caulfield <pcaulfie@redhat.com>
Subject: Re: [linux-lvm] vgextend and anomaly?
Message-ID: <20040906121339.GE1421@tykepenguin.com>
References: <200409061146.i86BkOQC083924@d06nrmr1307.portsmouth.uk.ibm.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <200409061146.i86BkOQC083924@d06nrmr1307.portsmouth.uk.ibm.com>
Sender: Patrick <patrick@tykepenguin.com>
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Mon, Sep 06, 2004 at 02:46:23PM +0300, Liivo Liivrand wrote:
>    Hello!
>     
>    I've set up LVM2 and using it for a long time. Now I'd like to extend it,
>    but some strange things will happen. Here is the output on what I'm doing.
>    Could anybody explain this and help me out?

LVM is seeing the metadata on the md device and the "real" nbd device. 

Check that your /etc/lvm/lvm.conf file has the following entry in the "devices"
section:

  md_component_detection = 1


If that still doesn't work then you can either disable the nb* devices using a
filter or (which I prefer) only enable /dev/md* devices using the filter.
-- 

patrick
