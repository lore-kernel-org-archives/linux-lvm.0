From: lembark@wrkhors.com
Subject: Re: [linux-lvm] FW: Logical Volume Manager
Message-ID: <114770000.1028576566@duke>
In-Reply-To: <20020805210711.G20768@vestdata.no>
References: <FOEKLLKHFOMPIDEHNBHMMEAJCDAA.mmouw@sistina.com>
 <20020805182225.GA28108@localhost> <20020805210711.G20768@vestdata.no>
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
Date: Mon Aug  5 14:45:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

>> >           I wonder if you can help me please, I want to setup a 11TB single
>> > volume under Redhat Linux 7.3 but LVM appears to only support 300GB is it
>> > possible for it to support 11TB.

Better question might by why you'd want to set up an 11TB
file system in the first place. Anything this size will be
hell to manage.

What is going on the file system?

--
Steven Lembark                              2930 W. Palmer
Workhorse Computing                      Chicago, IL 60647
                                           +1 800 762 1582
