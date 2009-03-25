Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n2PChRbB028102
	for <linux-lvm@redhat.com>; Wed, 25 Mar 2009 08:43:27 -0400
Received: from rv-out-0506.google.com (rv-out-0506.google.com [209.85.198.231])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id n2PCh9xp014936
	for <linux-lvm@redhat.com>; Wed, 25 Mar 2009 08:43:09 -0400
Received: by rv-out-0506.google.com with SMTP id g37so2486898rvb.3
	for <linux-lvm@redhat.com>; Wed, 25 Mar 2009 05:43:09 -0700 (PDT)
MIME-Version: 1.0
Date: Wed, 25 Mar 2009 18:13:08 +0530
Message-ID: <ffa0f8300903250543i5409dc84m27cb6c64f1da14e3@mail.gmail.com>
From: Tejas Sumant <tejas.sumant@gmail.com>
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Metadata Header->size
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
To: linux-lvm@redhat.com

I have question about metadat area size.
/* On disk */
/* Structure size limited to one sector */
struct mda_header {
        uint32_t checksum_xl;   /* Checksum of rest of mda_header */
        char magic[16];       /* To aid scans for metadata */
        uint32_t version;
        uint64_t start;         /* Absolute start byte of mda_header */
        uint64_t size;          /* Size of metadata area */
<------------------------------

        struct rawLocn raw_locns[0];   /* NULL-terminated list */
};
The size mentioned in metadata header includes precommitted metadata
area(raw_locn[1]) or it excludes?

thanks.

-- 
Tejas Sumant
