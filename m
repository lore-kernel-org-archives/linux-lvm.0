Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id iBFJlmr13618
	for <linux-lvm@redhat.com>; Wed, 15 Dec 2004 14:47:48 -0500
Received: from mr2.schneider.com (mr2.schneider.com [161.222.161.9])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id iBFJllhw031417
	for <linux-lvm@redhat.com>; Wed, 15 Dec 2004 14:47:47 -0500
Received: from mm2.schneider.com (mm2.schneider.com [161.222.1.66])
	by mr2.schneider.com (8.12.10+Sun/8.12.10) with ESMTP id iBFJlcn1001296
	for <linux-lvm@redhat.com>; Wed, 15 Dec 2004 13:47:46 -0600 (CST)
Subject: Re: [linux-lvm] How to increase/decrease space
Message-ID: <OFF29F4998.D0184014-ON86256F6B.006C59E9-86256F6B.006C87BF@schneider.com>
From: AdabalaP@schneider.com
Date: Wed, 15 Dec 2004 13:45:26 -0600
MIME-Version: 1.0
Content-type: multipart/mixed; 
	Boundary="0__=09BBE5F8DFFFDF798f9e8a93df938690918c09BBE5F8DFFFDF79"
Content-Disposition: inline
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
To: LVM general discussion and development <linux-lvm@redhat.com>

--0__=09BBE5F8DFFFDF798f9e8a93df938690918c09BBE5F8DFFFDF79
Content-type: text/plain; charset=US-ASCII


Thanks Jason, I shall try "lvextend", But what about resizing (decreasing)
"/" file system.



                                                                                                                                       
                      Jason Martin                                                                                                     
                      <jhmartin@toger.u        To:       linux-lvm@redhat.com                                                          
                      s>                       cc:                                                                                     
                      Sent by:                 Subject:  Re: [linux-lvm] How to increase/decrease space                                
                      linux-lvm-bounces                                                                                                
                      @redhat.com                                                                                                      
                                                                                                                                       
                                                                                                                                       
                      12/15/2004 12:15                                                                                                 
                      PM                                                                                                               
                      Please respond to                                                                                                
                      LVM general                                                                                                      
                      discussion and                                                                                                   
                      development                                                                                                      
                                                                                                                                       
                                                                                                                                       




On Wed, Dec 15, 2004 at 12:11:30PM -0600, AdabalaP@schneider.com wrote:
> (1) Added more space (350 meg) to /usr using the command "lvresize
-L+350".
> When i display the volume group using "lvdisplay" it shows 2.3 gb, But
when
> i use "df -m" it is still at 1.9 gb and 92% used state.
You've resized the volume but not the filesystem sitting on top
of it. Some filesystems can be resized online while others must
be unmounted. Some may not be resizable at all.

See http://tldp.org/HOWTO/LVM-HOWTO/extendlv.html.

-Jason Martin
--
This message is PGP/MIME signed.
(See attached file: attvajez.dat)
_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://www.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

--0__=09BBE5F8DFFFDF798f9e8a93df938690918c09BBE5F8DFFFDF79
Content-type: application/octet-stream; 
	name="attvajez.dat"
Content-Disposition: attachment; filename="attvajez.dat"
Content-Transfer-Encoding: base64

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0NClZlcnNpb246IEdudVBHIHYxLjIuNiAoR05V
L0xpbnV4KQ0KQ29tbWVudDogLS1uby12ZXJib3NlDQoNCmlEOERCUUZCd0g5U2wyT0RXdXFWU0JN
UkFvZmlBSndMQ3oyZjE4c2FzZEZQZWRYOU1ENDFkT0wzSFFDZmZMRC8NCnJPTFVCWVJGVXdjK0NK
bC9XcXQ1bmprPQ0KPTY4aEkNCi0tLS0tRU5EIFBHUCBTSUdOQVRVUkUtLS0tLQ0K


--0__=09BBE5F8DFFFDF798f9e8a93df938690918c09BBE5F8DFFFDF79--
