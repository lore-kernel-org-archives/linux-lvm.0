Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j3EIHhO07519
	for <linux-lvm@redhat.com>; Thu, 14 Apr 2005 14:17:43 -0400
Received: from wproxy.gmail.com (wproxy.gmail.com [64.233.184.195])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j3EIHg3B011948
	for <linux-lvm@redhat.com>; Thu, 14 Apr 2005 14:17:42 -0400
Received: by wproxy.gmail.com with SMTP id 68so597035wra
	for <linux-lvm@redhat.com>; Thu, 14 Apr 2005 11:17:34 -0700 (PDT)
Message-ID: <addede3b05041411175226a888@mail.gmail.com>
Date: Thu, 14 Apr 2005 11:17:32 -0700
From: Saqib Ali <docbook.xml@gmail.com>
In-Reply-To: <1113495234.25261.28.camel@grma-lap>
Mime-Version: 1.0
Content-Disposition: inline
References: <1113495234.25261.28.camel@grma-lap>
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] Re: How to mirror or Replicate a primary server's data
	to a secondarymachine
Reply-To: Saqib Ali <docbook.xml@gmail.com>,
	LVM general discussion and development <linux-lvm@redhat.com>
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
To: Gary.Mansell@ricardo.com, "Red Hat Enterprise Linux 4 (Nahant) Discussion List" <nahant-list@redhat.com>
Cc: taroon-list@redhat.com, linux-poweredge@dell.com, linux-lvm@redhat.com

If you want to implement a failover solution, you might want to
consider using shared storage,  e.g. :
1)  a HP clustered server with shared data storage; or
2) a XIOTECH SAN; or
3) or a NAS. You can build a NAS using Linux.

If you dont want to go the route of shared storage, you can probably
use RSYNC to perform replication of data.

-- 
In Peace,
Saqib Ali
http://tools.tldp.org/search.php <--- Search for Linux HOWTOs
