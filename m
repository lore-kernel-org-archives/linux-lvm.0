Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i86D3O315354
	for <linux-lvm@redhat.com>; Mon, 6 Sep 2004 09:03:24 -0400
Received: from mtagate2.uk.ibm.com (mtagate2.uk.ibm.com [195.212.29.135])
	by mx1.redhat.com (8.12.10/8.12.10) with ESMTP id i86D3NS0030855
	for <linux-lvm@redhat.com>; Mon, 6 Sep 2004 09:03:24 -0400
Received: from d06nrmr1307.portsmouth.uk.ibm.com
	(d06nrmr1307.portsmouth.uk.ibm.com [9.149.38.129])
	by mtagate2.uk.ibm.com (8.12.10/8.12.10) with ESMTP id i86D3IGH148858
	for <linux-lvm@redhat.com>; Mon, 6 Sep 2004 13:03:18 GMT
Received: from LiivoTP (d06av02.portsmouth.uk.ibm.com [9.149.37.228])
	by d06nrmr1307.portsmouth.uk.ibm.com (8.12.10/NCO/VER6.6) with ESMTP id
	i86D3HQC085398
	for <linux-lvm@redhat.com>; Mon, 6 Sep 2004 14:03:17 +0100
Message-Id: <200409061303.i86D3HQC085398@d06nrmr1307.portsmouth.uk.ibm.com>
From: "Liivo Liivrand" <liivo@nnm.ee>
Subject: RE: [linux-lvm] vgextend and anomaly?
Date: Mon, 6 Sep 2004 16:03:15 +0300
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <20040906121339.GE1421@tykepenguin.com>
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
To: 'LVM general discussion and development' <linux-lvm@redhat.com>

Didn't try it yet, but before everything have been worked with the same
schema, also extending. So, why not this time?

-----Original Message-----
From: linux-lvm-bounces@redhat.com [mailto:linux-lvm-bounces@redhat.com] On
Behalf Of Patrick Caulfield
Sent: 6. september 2004. a. 15:14
To: LVM general discussion and development
Subject: Re: [linux-lvm] vgextend and anomaly?

On Mon, Sep 06, 2004 at 02:46:23PM +0300, Liivo Liivrand wrote:
>    Hello!
>     
>    I've set up LVM2 and using it for a long time. Now I'd like to extend
it,
>    but some strange things will happen. Here is the output on what I'm
doing.
>    Could anybody explain this and help me out?

LVM is seeing the metadata on the md device and the "real" nbd device. 

Check that your /etc/lvm/lvm.conf file has the following entry in the
"devices"
section:

  md_component_detection = 1


If that still doesn't work then you can either disable the nb* devices using
a filter or (which I prefer) only enable /dev/md* devices using the filter.
-- 

patrick
_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://www.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
