From: Steven Lembark <lembark@wrkhors.com>
Subject: Re: [linux-lvm] I'm confused
Message-ID: <73620000.1039399481@[192.168.100.3]>
In-Reply-To: <200212082343.49466.pantaleimon@home.no>
References: <3DF2B8D1.7070702@machturtle.com>
 <20021208040653.GF12437@orthanc> <3DF32C32.4080501@machturtle.com>
 <200212082343.49466.pantaleimon@home.no>
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
Date: Sun Dec  8 20:09:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com


-- Pantaleimon <pantaleimon@home.no>

> On Sunday 08 December 2002 12:25, David Corbin wrote:
>
> [snip]
>
>> Well, About 3 gig is other partions, and it appears to me that the other
>> 7G is lost to making the raid device and various overheads (though that
>> sure seems excessive).
>>
>
> I think hardisk manufacturers use base 10, rather than base 2, when they
> speak  of "mega" and "giga", ie. mega = 1000K and not 1024K. That means
> that a 120G  hardisk is only 114.4G. Hence, 109.77G + about 3G = about
> 113G. Hmm, still  about 1.5G missing.

They also quote the size before laying down timing tracks
and bad block mappings -- along with the bad blocks. That
accounts for another 10%.

Drives look kind of like modern lumber: you have to ignore
the nominal size in your calculations and deal with finished
size in order to plan for anything -- or just accept that
10% "shrinkage" is a normal part of life.


--
Steven Lembark                               2930 W. Palmer
Workhorse Computing                       Chicago, IL 60647
                                            +1 800 762 1582
