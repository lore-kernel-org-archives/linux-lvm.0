From: Steven Lembark <lembark@wrkhors.com>
Subject: Re: [linux-lvm] vgcreate on 1.5TB volume
Message-ID: <16900000.1034642423@[192.168.200.4]>
In-Reply-To: <1034629471.29780.58.camel@UberGeek.coremetrics.com>
References: <1034629471.29780.58.camel@UberGeek.coremetrics.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
Date: Mon Oct 14 19:46:46 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

> What is the best way to get all 1.5TB in one LV?

What are you using the space for? Nearly anything that would
handle that much space can divide the space up into multiple
areas (e.g., oracle tablespaces) that allow more reasonably
sized filesystems.


--
Steven Lembark                               2930 W. Palmer
Workhorse Computing                       Chicago, IL 60647
                                            +1 800 762 1582
