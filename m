Message-ID: <3BA67CD0.5020703@st-peter.stw.uni-erlangen.de>
Date: Tue, 18 Sep 2001 00:44:32 +0200
From: svetljo <galia@st-peter.stw.uni-erlangen.de>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Re: lvcreate dumping core with 2.4.10-pre9 (was pvcreate ...)
References: <200109160203.WAA10814@erez.physics.lsa.umich.edu> <200109160207.WAA10835@erez.physics.lsa.umich.edu> <20010916025223.1CA035E041@oscar.casa.dyndns.org> <200109161731.NAA11318@erez.physics.lsa.umich.edu> <200109161956.PAA11662@erez.physics.lsa.umich.edu> <3BA50657.3020600@st-peter.stw.uni-erlangen.de> <200109172228.SAA24083@erez.physics.lsa.umich.edu>
Content-Transfer-Encoding: 7bit
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

i had it working with 2.4.10-pre2 and pre4
and i thought to try it with 2.4.10-pre9 and i think there was some 
patch at :
http://lists.sistina.com/mailman/listinfo/lvm-devel or
http://lists.sistina.com/mailman/listinfo/lvm-commit


David Chin wrote:

>In message <3BA50657.3020600@st-peter.stw.uni-erlangen.de>, svetljo writes:
>
>>Hi
>>why don't you try pre 2.4.10-pre8 kernel, lvm is not ready for 
>>2.4.10-pre9 i think
>>and have you tried compileing the tools with configure --enable-static_link
>>
>
>I just tried 2.4.10-pre8, but without the "enable-static_link" option.  
>Still dumps core.  Has anyone on this list had success with lvm-1.0.1-rc2 
>and a 2.4.10 kernel?
>
>--Dave
>
>
>
>_______________________________________________
>linux-lvm mailing list
>linux-lvm@sistina.com
>http://lists.sistina.com/mailman/listinfo/linux-lvm
>read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
>
