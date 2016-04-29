Received: from [10.10.55.165] (vpn-55-165.rdu2.redhat.com [10.10.55.165])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u3TDKdWE020267
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Fri, 29 Apr 2016 09:20:39 -0400
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
From: Brassow Jonathan <jbrassow@redhat.com>
In-Reply-To: <CAFDa5Q2qAxQDzCRLaepjijJDinG6QzUHZo-7BVDscC06R-mZzw@mail.gmail.com>
Date: Fri, 29 Apr 2016 08:20:38 -0500
Message-Id: <2402C348-794E-4159-A744-2DE5EEFCE7AC@redhat.com>
References: <4b0d651386c11fdb2808a9f4bb88fc36@dds.nl>
	<CAFDa5Q2qAxQDzCRLaepjijJDinG6QzUHZo-7BVDscC06R-mZzw@mail.gmail.com>
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] is lvmcache really ready?
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


> On Apr 23, 2016, at 1:10 PM, Dax Kelson <dkelson@gurulabs.com> wrote:
> 
> I don't always write emails, but when I do, it's a stream of consciousness.
> 
> We use LVM Cache in production in the infrastructure hosting our online classroom environment. The read requests hitting our origin LV dropped by 90%. We're pretty happy with it.
> 
> I wish you could have multiple origin LVs using the same cache pool.

BTW, If you use thin-provisioning, you can.  If you cache the ThinDataLV (see lvmthin(7)), the effect will be that all thinLVs are cached.

 brassow
