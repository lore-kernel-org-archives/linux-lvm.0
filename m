Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l519ZiXJ015322
	for <linux-lvm@redhat.com>; Fri, 1 Jun 2007 05:35:45 -0400
Received: from acheron.ifi.lmu.de (acheron.ifi.lmu.de [129.187.214.135])
	by mx2.redhat.com (8.13.1/8.13.1) with ESMTP id l519ZTLr013879
	for <linux-lvm@redhat.com>; Fri, 1 Jun 2007 05:35:29 -0400
Message-ID: <465FE85B.2040500@bio.ifi.lmu.de>
Date: Fri, 01 Jun 2007 11:35:23 +0200
From: Frank Steiner <fsteiner-mail1@bio.ifi.lmu.de>
MIME-Version: 1.0
References: <465D229E.5080809@bio.ifi.lmu.de> <20070530082312.GA11045@janus>
In-Reply-To: <20070530082312.GA11045@janus>
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Re: [NFS] Stale NFS handles on LVM2
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
To: Frank van Maarseveen <frankvm@frankvm.com>
Cc: nfs@lists.sourceforge.net, linux-lvm@redhat.com

Frank van Maarseveen wrote

> Use the fsid= option in /etc/exports to avoid this problem (clients need
> to remount because this changes filehandles again).

That works fine :-))) Thanks a lot! I'm using this for all our NFS exports now.

cu,
Frank
 


-- 
Dipl.-Inform. Frank Steiner   Web:  http://www.bio.ifi.lmu.de/~steiner/
Lehrstuhl f. Bioinformatik    Mail: http://www.bio.ifi.lmu.de/~steiner/m/
LMU, Amalienstr. 17           Phone: +49 89 2180-4049
80333 Muenchen, Germany       Fax:   +49 89 2180-99-4049
* Rekursion kann man erst verstehen, wenn man Rekursion verstanden hat. *
