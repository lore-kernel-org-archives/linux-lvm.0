From: Steven Lembark <lembark@wrkhors.com>
Subject: Re: [linux-lvm] LVM performance
Message-ID: <39970000.1006679656@dizzy>
In-Reply-To: <Pine.LNX.4.33.0111230911340.6061-100000@dragon.inside.ntisys.com>
References: <Pine.LNX.4.33.0111230911340.6061-100000@dragon.inside.ntisys.co
 m>
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
Date: Sun Nov 25 21:15:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com


-- Benjamin Scott <bscott@ntisys.com>

>  Actually,
> I favor SCSI.  :-)

Me too, but more scsi-ish behavior can be arrived at by
tinkering with hdparm. Mainly the delayed write, buffer
size can help enormously.

--
Steven Lembark                               2930 W. Palmer
Workhorse Computing                       Chicago, IL 60647
                                            +1 800 762 1582
